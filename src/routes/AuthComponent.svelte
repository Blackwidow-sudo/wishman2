<script lang="ts">
	/**
	 * Props
	 */
	export let authenticated: boolean
</script>

<ul>
	{#if authenticated}
		<li>
			<a href="/account">Account</a>
		</li>
		<li>
			<a href="/logout">Logout</a>
		</li>
	{:else}
		<li>
			<a href="/register">Register</a>
		</li>
		<li>
			<a href="/login">Login</a>
		</li>
	{/if}
</ul>
