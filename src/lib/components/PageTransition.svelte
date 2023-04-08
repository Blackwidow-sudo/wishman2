<script lang="ts">
	import { fade, type FadeParams } from 'svelte/transition';

	/**
	 * Props
	 */
	export let inParams: FadeParams = {
		delay: 150,
		duration: 75
	};
	export let outParams: FadeParams = {
		duration: 75
	};
</script>

<main
	class="container mx-auto mt-24"
	in:fade={inParams}
	out:fade={outParams}>
	<slot />
</main>
