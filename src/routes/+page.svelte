<script>
	import Footer from '$lib/components/Footer.svelte';

	import { PANEL_STYLE } from '$lib/consts';
	import { dateAgo } from '$lib/util';

	import nyanyamachine_dev from '$lib/assets/88x31/nyanyamachine_dev.gif';

	// yeah. the posts are manually added right now. i uh will fix this soon i promise
	const posts = [
		{
			title: 'a small vent regarding recent events.',
			subtitle: 'why are people like this',
			fullDate: new Date('2026-03-16T23:50:00.001Z'),
			date: '20260316',
			slug: 'a-small-vent'
		}
	];

	const buttons = [
		{
			img: nyanyamachine_dev,
			link: 'https://nyanyamachine.dev'
		},
		{
			img: 'https://media.vixen.lgbt/88x31.gif',
			link: 'https://vixen.lgbt'
		}
	];
</script>

<svelte:head>
	<title>the vixen's virtual den</title>
	<meta name="description" content="the personal website of @asleepyskye" />
	<meta name="theme-color" content="#b5ddf7" />
</svelte:head>

<div class="flex h-full flex-col py-8">
	<div class="mx-auto w-full max-w-[80%] flex-1 ${PANEL_STYLE}">
		<!-- I LOVE FLEX CONTAINERS! don't @ me. ill fix this someday... maybe -->
		<div class="flex h-full w-full flex-col gap-4 font-mono md:p-4 lg:flex-row">
			<div class="w-full rounded-lg p-4 lg:w-1/3">
				<h1
					class="text-3xl
tracking-tight text-slate-900 sm:text-4xl dark:text-slate-50"
				>
					vixen.lgbt
				</h1>
				<li class="list-none space-y-4 px-3 py-6">
					<ul>
						<a href="">> shiny things</a>
						<p class="text-xs leading-relaxed">(projects + contributions)</p>
					</ul>
					<ul>
						<a href="">> fox posting</a>
						<p class="text-xs leading-relaxed">(blog)</p>
					</ul>
					<ul>
						<a href="">> about the fox</a>
						<p class="text-xs leading-relaxed">(hey that's me!)</p>
					</ul>
				</li>
				<div class="text-sm">
					<p>maybe someday ill finish this website... ~astra</p>
					<br />
					<p>
						uhhh go follow our <a href="https://bsky.app/profile/vixen.lgbt">bluesky</a> or smth
					</p>
					<p>and plz, send us more 88x31 :3</p>
				</div>
				<div class="flex justify-center gap-2 py-4">
					{#each buttons as button}
						<a href={button.link}
							><img
								src={button.img}
								width="88"
								height="31"
								style="image-rendering: pixelated; border: none;"
							/></a
						>
					{/each}
				</div>
			</div>

			<div class="w-full rounded-lg border border-slate-300 p-8 lg:w-2/3">
				<h2
					class="text-xl
tracking-tight text-slate-900 underline sm:text-xl dark:text-slate-50"
				>
					recent blog posts:
				</h2>
				<li class="list-none py-4">
					{#each posts as post}
						<ul>
							<a href="{post.date}/{post.slug}">{post.title}</a>
							<h4 class="px-8 text-sm">{post.subtitle}</h4>
							<p class="py-2 text-xs">{dateAgo(post.fullDate)}</p>
						</ul>
					{/each}
				</li>
			</div>
		</div>
	</div>
	<Footer />
</div>

<style>
	a {
		color: rgb(127, 146, 255);
	}
</style>
