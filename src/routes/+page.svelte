<script>
	import neofox_laptop from '$lib/assets/neofox/neofox_laptop.png';
	import Footer from '$lib/components/Footer.svelte';
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
	<Footer />
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
	a {
		color: rgb(127, 146, 255);
	}
</style>
