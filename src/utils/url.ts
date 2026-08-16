/**
 * Monta um link interno respeitando o `base` configurado em `astro.config.mjs`.
 *
 * No GitHub Pages, um repositório chamado `Stargazer` publica o site em
 * `usuario.github.io/Stargazer`, então todo link interno precisa desse prefixo.
 * Se um dia o site for para a raiz do domínio, basta remover o `base` da config:
 * esta função continua funcionando sem nenhuma outra mudança.
 */
export function url(path = '/'): string {
	const base = import.meta.env.BASE_URL.replace(/\/$/, '');
	if (path === '/') return `${base}/`;
	return `${base}/${path.replace(/^\//, '')}`;
}
