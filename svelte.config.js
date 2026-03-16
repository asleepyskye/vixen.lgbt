import adapter from '@sveltejs/adapter-static';
import { markdocPreprocess } from 'markdoc-svelte';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import functions from './src/lib/functions.js';
import tags from './src/lib/tags.js';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	extensions: ['.svelte', '.mdoc', '.md'],
	preprocess: [vitePreprocess(), markdocPreprocess({ functions: functions, tags: tags })],

	kit: {
		adapter: adapter({
			fallback: undefined,
			strict: true
		}),

		alias: {
			$posts: 'src/posts'
		}
	}
};

export default config;
