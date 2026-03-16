<script lang="ts">
	let { data } = $props();

	let fm = data.page.frontmatter;
</script>

<svelte:head>
	<title>{data.page.frontmatter?.title ?? 'untitled post'}</title>
	<meta name="description" content={data.page.frontmatter?.description ?? ''} />
</svelte:head>

<article class="mx-auto max-w-4xl px-4 py-16 sm:px-6 lg:px-8">
	<header class="mb-12">
		<h1 class="text-3xl font-extrabold tracking-tight text-slate-900 sm:text-4xl">
			{fm?.title}
		</h1>
		{#if fm?.subtitle}
			<h2 class="mt-4 text-xl text-slate-600">
				{fm.subtitle}
			</h2>
		{/if}
		{#if fm?.date}
			<p class="mt-4 text-sm text-slate-500">{fm.date}</p>
		{/if}
	</header>

	<div class="prose prose-slate prose-lg max-w-none">
		<data.page.default />
	</div>

	<hr class="my-12 border-slate-200" />
	<footer class="text-center text-slate-500">
		<p>
			comments? feel free to email us at
			<a
				href="mailto:skye@vixen.lgbt"
				aria-label="email"
				class="font-medium text-blue-600 transition-colors hover:text-blue-500 hover:underline"
			>
				skye@vixen.lgbt
			</a>
		</p>
	</footer>
</article>
