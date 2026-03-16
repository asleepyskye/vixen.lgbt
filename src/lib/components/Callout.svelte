<script lang="ts">
	import neofox_laptop from '$lib/assets/neofox/neofox_laptop.png';
	let { type = 'info', children } = $props();
	const types: any = {
		note: {
			style: 'bg-pink-50 border-pink-400 text-pink-900 text-base',
			image: neofox_laptop
		},
		warning: {
			style: 'bg-amber-50 border-amber-400 text-amber-900 text-base',
			image: ''
		},
		warning_but_louder: {
			style: 'bg-amber-50 border-amber-400 text-amber-900 text-xl',
			image: ''
		}
	};
</script>

<aside class="not-prose my-8 flex flex-row gap-4 rounded-r-sm border-l-4 p-4 {types[type].style}">
	{#if types[type].image}
		<div class="w-1/16 shrink-0">
			<img src={types[type].image} class="h-full w-full object-cover" />
		</div>
	{/if}
	<div class="leading-relaxed">
		{@render children?.()}
	</div>
</aside>
