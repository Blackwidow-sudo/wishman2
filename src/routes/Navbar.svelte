<script lang="ts">
	import AuthComponent from './AuthComponent.svelte'
	import type { Route } from '$types/app'

	/**
	 * Props
	 */
	export let routes: Route[]
	export let authenticated: boolean
</script>

<nav class="container-fluid">
	<ul>
		{#each routes as { name, href }}
			<li>
				<a {href}>
					{name}
				</a>
			</li>
		{/each}
	</ul>
	<AuthComponent {authenticated} />
</nav>
