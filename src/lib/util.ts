// yeah i wrote this for the PK status page and im temporarily reusing it here
// i hate it
//kinda janky but it works
export function dateAgo(date: number) {
	if (date == 0) return 'never';
	// difference in milliseconds
	const msDifference = date - Date.now();
	// convert to seconds
	const diffSeconds = msDifference / 1000;
	const diffMinutes = diffSeconds / 60;
	const diffHours = diffMinutes / 60;
	const diffDays = diffHours / 24;

	if (Math.abs(diffDays) > 1)
		return new Date(date).toLocaleString('en-us', { dateStyle: 'short', timeStyle: 'short' });

	const rtf = new Intl.RelativeTimeFormat('en', { numeric: 'auto' });

	let diff = '';
	if (Math.abs(diffDays) > 1) diff = rtf.format(Math.floor(diffDays), 'day');
	else if (Math.abs(diffHours) > 1) diff = rtf.format(Math.floor(diffHours), 'hour');
	else if (Math.abs(diffMinutes) > 1) diff = rtf.format(Math.floor(diffMinutes), 'minute');
	else diff = rtf.format(Math.floor(diffSeconds), 'second');

	return diff;
}
