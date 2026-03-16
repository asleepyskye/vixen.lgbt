/** @type {import('markdoc-svelte').Config['tags']} */

const tags = {
    callout: {
        render: 'Callout',
        children: ['paragraph', 'tag', 'list'],
        attributes: {
            type: {
                type: String,
                default: 'note',
                matches: ['note', 'warning', 'warning_but_louder'],
            }
        }
    },
};

export default tags;