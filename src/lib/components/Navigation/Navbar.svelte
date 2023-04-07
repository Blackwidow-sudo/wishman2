<script lang="ts">
	import { afterNavigate } from '$app/navigation'
	import { page } from '$app/stores'
	import AuthComponent from './AuthComponent.svelte'
	import type { Route } from '$types/app'
	import GiftIcon from '$lib/icons/GiftIcon.svelte'

	/**
	 * Props
	 */
	export let routes: Route[]
	export let authenticated: boolean

	/**
	 * State
	 */
	let expanded = false

	/**
	 * Lifecycle
	 */
	afterNavigate(() => {
		expanded = false
	})

	/**
	 * Methods
	 */
	function onExpand() {
		expanded = !expanded
	}

	$: isActive = (href: string) => {
		return href === $page.url.pathname
	}
</script>

<nav
	class="bg-white dark:bg-gray-900 fixed w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600">
	<div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
		<!-- Brand -->
		<a
			href="/"
			class="flex items-center">
			<!-- <img
				src="https://flowbite.com/docs/images/logo.svg"
				class="h-8 mr-3"
				alt="Flowbite Logo" /> -->
			<span class="mr-3 text-white">
				<GiftIcon />
			</span>
			<span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">
				Wishman
			</span>
		</a>
		<div class="flex md:order-2">
			<!-- Auth -->
			<AuthComponent
				{authenticated}
				on:logout />
			<!-- Hamburger -->
			<button
				data-collapse-toggle="navbar-sticky"
				type="button"
				class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
				aria-controls="navbar-sticky"
				aria-expanded="false"
				on:click={onExpand}>
				<span class="sr-only">Open main menu</span>
				<svg
					class="w-6 h-6"
					aria-hidden="true"
					fill="currentColor"
					viewBox="0 0 20 20"
					xmlns="http://www.w3.org/2000/svg">
					<path
						fill-rule="evenodd"
						d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
						clip-rule="evenodd" />
				</svg>
			</button>
		</div>
		<!-- Nav links -->
		<div
			class:hidden={!expanded}
			class="items-center justify-between w-full md:flex md:w-auto md:order-1"
			id="navbar-sticky">
			<ul
				class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
				{#each routes as { name, href }}
					<li>
						<a
							{href}
							aria-current={isActive(href) ? 'page' : null}
							class:md:text-blue-700={isActive(href)}
							class:md:dark:text-blue-500={isActive(href)}
							class:hover:bg-gray-100={!isActive(href)}
							class:dark:hover:bg-gray-700={!isActive(href)}
							class:bg-blue-500={isActive(href)}
							class="block py-2 pl-3 pr-4 text-gray-900 rounded md:bg-transparent md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">
							{name}
						</a>
					</li>
				{/each}
			</ul>
		</div>
	</div>
</nav>
