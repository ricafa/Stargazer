/**
 * Deriva o slug de uma tag do jeito que aparece na URL: minusculo, sem
 * acento, espacos trocados por hifen. Usado tanto para montar os links
 * quanto para gerar as paginas em `getStaticPaths`.
 */
export function tagSlug(tag: string): string {
	return tag
		.normalize('NFD')
		.replace(/[\u0300-\u036f]/g, '')
		.toLowerCase()
		.trim()
		.replace(/\s+/g, '-');
}
