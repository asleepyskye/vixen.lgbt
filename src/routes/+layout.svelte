<script lang="ts">
	import Theme from '$lib/components/Theme.svelte';
	import '../app.css';

	let { children } = $props();
</script>

<Theme />

{@render children()}
