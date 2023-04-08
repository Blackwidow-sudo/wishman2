<script lang="ts">
	import '../app.scss'
	import { invalidate } from '$app/navigation'
	import { routes } from '$lib/globals'
	import Navbar from '../lib/components/Navigation/Navbar.svelte'
	import { onMount } from 'svelte'
	import type { LayoutData } from './$types'

	/**
	 * Props
	 */
	export let data: LayoutData

	/**
	 * State
	 */
	$: ({ supabase, session } = data)

	/**
	 * Lifecycle methods
	 */
	onMount(() => {
		const {
			data: { subscription }
		} = supabase.auth.onAuthStateChange((event, _session) => {
			if (_session?.expires_at !== session?.expires_at) {
				invalidate('supabase:auth')
			}
		})

		return () => subscription.unsubscribe()
	})
</script>

<Navbar
	{routes}
	authenticated={!!session} />
<slot />
