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

//this is uh. temporary cuz im lazy
import type { EntryGenerator } from './$types';
export const entries: EntryGenerator = () => {
	return [{ date: '20260316', slug: 'a-small-vent' }];
};
