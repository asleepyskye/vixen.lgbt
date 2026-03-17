import { error } from '@sveltejs/kit';
import type { MarkdocModule } from 'markdoc-svelte';

export const load = async ({ params }) => {
	const date = params.date;
	const slug = params.slug;
	try {
		const page = (await import(`$posts/${date}-${slug}.md`)) as MarkdocModule;
		return { page };
	} catch (e: any) {
		throw error(404, `not found`);
	}
};
