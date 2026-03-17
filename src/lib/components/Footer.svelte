<script lang="ts">
	import neofox_flop_sleep from '$lib/assets/neofox/neofox_flop_sleep.png';
	import emoji_transflag from '$lib/assets/emoji/trans.svg';
</script>

<footer class="mx-auto rounded-xl p-4 text-center dark:bg-[#000000]/40">
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
		neofox emojis: <a href="https://volpeon.ink/emojis/neofox/">Neofox by Volpeon</a>licensed under
		CC BY-NC-SA 4.0.
	</p>
</footer>

<style>
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
		white-space: nowrap;
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
