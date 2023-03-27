<script lang="ts">
	import '../app.scss'
	import Navbar from './Navbar.svelte'
	import type { Route } from '$types/app'

	/**
	 * State
	 */
	const routes: Route[] = [{ name: 'Home', href: '/' }]
	const authenticated = false
</script>

<Navbar
	{routes}
	{authenticated} />
<main class="container">
	<slot />
</main>
