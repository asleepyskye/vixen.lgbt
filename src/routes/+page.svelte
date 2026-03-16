<script>
	import neofox_laptop from '$lib/assets/neofox/neofox_laptop.png';
	import neofox_flop_sleep from '$lib/assets/neofox/neofox_flop_sleep.png';
	import emoji_transflag from '$lib/assets/emoji/trans.svg';
</script>

<svelte:head>
	<title>the vixen's virtual den</title>
</svelte:head>

<div class="placeholder-wrapper">
	<div class="placeholder-card">
		<center
			><img
				alt="neofox_laptop - a fox behind a laptop"
				src={neofox_laptop}
				class="tmp-neofox-laptop"
			/></center
		>
		<br />
		<p>uhhhhhhh we need to finish this website :p</p>
		<br />
		<p>
			in the mean time, voice training resources can be found <a
				href="https://res.vixen.lgbt/voice-training/">here</a
			>
		</p>
		<br />
		<p>
			our archive of public pages we find helpful can be found <a href="https://archive.vixen.lgbt/"
				>here</a
			>
		</p>
		<br />
		<p>and uhhh go follow our <a href="https://bsky.app/profile/vixen.lgbt">bluesky</a> or smth</p>
	</div>
	<footer>
		<p class="footer-text">
			<span class="footer-emoji">
				<img src={neofox_flop_sleep} alt="neofox_flop_sleep - a fox sleeping" class="emoji" />
				<img src={emoji_transflag} alt="Trans Flag" class="emoji" />
			</span>
			@asleepyskye ~ <a href="https://vixen.lgbt" class="footer-gay-link">vixen.lgbt</a>
			<span class="footer-emoji">
				<img src={emoji_transflag} alt="Trans Flag" class="emoji" />
				<img src={neofox_flop_sleep} alt="neofox_flop_sleep - a fox sleeping" class="emoji" />
			</span>
		</p>
		<p class="footer-text">
			neofox emojis: <a href="https://volpeon.ink/emojis/neofox/">Neofox by Volpeon</a>licensed
			under CC BY-NC-SA 4.0.
		</p>
	</footer>
</div>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap');

	.placeholder-wrapper {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		min-height: 100vh;
		width: 100%;
		padding: 20px;
		box-sizing: border-box;
		font-family: 'Open Sans', sans-serif;
	}

	.placeholder-card {
		border: 1px solid #e0e0e0;
		padding: 2rem;
		background-color: #ffffff;
		border-radius: 8px;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		text-align: center;
		margin-bottom: 1rem;
		max-width: 600px;
		width: 90%;
	}
	.tmp-neofox-laptop {
		width: 50px;
		height: 50px;
	}

	footer {
		text-align: center;
		color: #616161;
		margin-top: 1rem;
		width: 90%;
		max-width: 500px;
	}
	.footer-text {
		font-size: 0.8em;
		font-style: italic;
		color: #777;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
		gap: 0.3rem;
	}
	.footer-emoji {
		display: inline-flex;
		align-items: center;
		gap: 0.2rem;
	}
	a {
		color: rgb(127, 146, 255);
	}
	img.emoji {
		height: 1.5em !important;
		width: 1.5em !important;
		vertical-align: -0.4em !important;
	}
	.footer-gay-link {
		background: linear-gradient(to right, #d62e00, #ff9a56, #d362a4, #a30262) !important;
		-webkit-background-clip: text !important;
		-webkit-text-fill-color: transparent !important;
		text-decoration: none !important;
		font-style: inherit !important;
		font-size: inherit !important;
		font-weight: normal !important;
	}
</style>
