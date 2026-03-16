<script lang="ts">
	let { children } = $props();
</script>

<aside class="not-prose my-1">
	<div class="text-sm leading-relaxed">
		{@render children?.()}
	</div>
</aside>
