-- Create a table for public profiles
create table public.profiles (
  id uuid references auth.users not null primary key,
  username text,
  avatar_url text,
  updated_at timestamp with time zone,
  created_at timestamp with time zone not null default now(),

  constraint username_length check (char_length(username) >= 3)
);


-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table public.profiles
  enable row level security;

create policy "profiles_allow_select_for_auth_user"
  on public.profiles
  as permissive
  for select
  to authenticated
  using (true);

create policy "profiles_allow_insert_for_own"
  on public.profiles
  as permissive
  for insert
  to authenticated
  with check (auth.uid() = id);

create policy "profiles_allow_update_for_own"
  on public.profiles
  as permissive
  for update
  to authenticated
  using (auth.uid() = id);


-- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.
-- See https://supabase.com/docs/guides/auth/managing-user-data#using-triggers for more details.
create function public.handle_new_user()
  returns trigger
  language plpgsql
  security definer
as $$
  begin
    insert into public.profiles (id, username)
    values (
      new.id,
      new.raw_user_meta_data->>'username'
    );

    return new;
  end;
$$;

create trigger on_auth_user_created
  after insert
  on auth.users
  for each row 
  execute procedure public.handle_new_user();
