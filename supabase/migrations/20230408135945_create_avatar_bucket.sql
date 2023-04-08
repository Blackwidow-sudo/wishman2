-- Set up Storage!
insert into storage.buckets (id, name)
  values ('avatars', 'avatars');

-- Set up access controls for storage.
-- See https://supabase.com/docs/guides/storage#policy-examples for more details.
create policy "avatar_allow_select_for_auth_user"
  on storage.objects
  as permissive
  for select
  to authenticated
  using (bucket_id = 'avatars');

create policy "avatar_allow_upload_for_auth_user"
  on storage.objects
  as permissive
  for insert
  to authenticated
  with check (bucket_id = 'avatars');

create policy "avatar_allow_update_for_own"
  on storage.objects
  as permissive
  for update
  to authenticated
  using (auth.uid() = owner) with check (bucket_id = 'avatars');
