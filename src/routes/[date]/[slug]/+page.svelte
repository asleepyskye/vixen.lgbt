<script lang="ts">
	import Footer from '$lib/components/Footer.svelte';
	import { PANEL_STYLE } from '$lib/consts';

	let { data } = $props();

	let fm = data.page.frontmatter;
</script>

<svelte:head>
	<title>{fm?.title ?? 'untitled post'}</title>
	<meta name="description" content={fm?.subtitle ?? fm?.description ?? ''} />
	<meta name="article:author" content="skye" />
</svelte:head>

<article class="mx-auto max-w-4xl ${PANEL_STYLE}">
	<header class="mb-12">
		<a href="/" class="font-mono"> &lt; back</a>
		<h1
			class="py-2 text-3xl font-extrabold tracking-tight text-slate-900 sm:text-4xl dark:text-slate-50"
		>
			{fm?.title}
		</h1>
		{#if fm?.subtitle}
			<h2 class="mt-4 text-xl text-slate-900 dark:text-slate-200">
				{fm.subtitle}
			</h2>
		{/if}
		{#if fm?.date}
			<p class="mt-4 text-sm text-slate-900 dark:text-slate-200">{new Date(fm.date)}</p>
		{/if}
	</header>

	<div class="prose prose-slate prose-lg dark:prose-invert max-w-none">
		<data.page.default />
	</div>

	<hr class="my-12 border-slate-200" />
	<footer class="text-center">
		<p>
			comments? feel free to email us at
			<a
				href="mailto:skye@vixen.lgbt"
				aria-label="email"
				class="font-medium text-blue-800 hover:text-blue-500 hover:underline"
			>
				skye@vixen.lgbt
			</a>
		</p>
	</footer>
	<Footer />
</article>
