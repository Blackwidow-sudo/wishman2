<script lang="ts">
	import { page } from '$app/stores'
	import { createEventDispatcher } from 'svelte'

	const dispatch = createEventDispatcher()

	/**
	 * Props
	 */
	export let authenticated: boolean

	/**
	 * Methods
	 */
	$: isActive = (href: string) => {
		return href === $page.url.pathname
	}

	function onLogout() {
		dispatch('logout')
	}
</script>

<ul class="flex flex-row font-medium">
	{#if authenticated}
		<li>
			<a
				href="/account"
				class:text-blue-700={isActive('/account')}
				class:dark:text-blue-500={isActive('/account')}
				class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-transparent hover:text-blue-700 p-0 dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:bg-transparent dark:border-gray-700">
				Account
			</a>
		</li>
		<button
			type="button"
			on:click={onLogout}>
			Logout
		</button>
	{:else}
		<li>
			<a
				href="/register"
				class:text-blue-700={isActive('/register')}
				class:dark:text-blue-500={isActive('/register')}
				class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-transparent hover:text-blue-700 p-0 dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:bg-transparent dark:border-gray-700">
				Register
			</a>
		</li>
		<li>
			<a
				href="/login"
				class:text-blue-700={isActive('/login')}
				class:dark:text-blue-500={isActive('/login')}
				class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-transparent hover:text-blue-700 p-0 dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:bg-transparent dark:border-gray-700">
				Login
			</a>
		</li>
	{/if}
</ul>
