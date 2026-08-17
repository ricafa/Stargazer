## Publicar um artigo novo (convenção deste blog)

Quando o usuário trouxer um texto para virar post — um `.txt`, um trecho colado, um rascunho —
não basta salvar o texto. O fluxo é:

1. **Salvar sempre como `.mdx`**, em `src/content/blog/<slug>.mdx`. Nunca `.md`: o formato das
   seções depende de componentes, que só funcionam em MDX.
2. **O nome do arquivo é a URL.** Derive o slug do título: minúsculas, sem acentos, com hifens.
   Renomear depois muda o endereço e o GitHub Pages não redireciona o antigo.
3. **Frontmatter** com `title`, `description` e `pubDate` (formato em inglês, ex.: `Aug 16 2026`).
4. **Dividir o texto em seções e envolver cada uma em `<Secao>`**, importando o componente logo
   abaixo do frontmatter:

   ```mdx
   import Secao from '../../components/Secao.astro';

   <Secao titulo="1. Principal ponto" resumo="Uma frase curta.">

   O texto completo da seção, em Markdown.

   </Secao>
   ```

   A linha em branco antes e depois do conteúdo é obrigatória — sem ela o MDX trata o bloco como
   JSX e o Markdown não é interpretado.
5. **Escrever o `resumo` de cada seção.** Ele não vem do texto original: é o assistente que
   redige, em no máximo **124 caracteres**, dizendo o ponto da seção. O componente valida esse
   limite e derruba o build se passar, então confira antes.
6. **A sanfona vai nas seções de primeiro nível.** Subseções (`###`) ficam dentro da sanfona da
   seção a que pertencem, sem sanfona própria — nada de sanfona dentro de sanfona.
7. **Parágrafo de abertura e a linha da fonte ficam fora de qualquer `<Secao>`**, sempre visíveis.
8. **Rodar `npm run build` antes de commitar.** É o que pega resumo longo demais, MDX malformado
   e link quebrado.

## Deploy

- `git push` na `main` publica sozinho, via `.github/workflows/deploy.yml`.
- O `base` no `astro.config.mjs` precisa ser idêntico ao nome do repositório no GitHub,
  **inclusive na caixa das letras**. Se divergir, o site sobe sem CSS e com os links internos
  quebrados.
- Links internos nunca são escritos à mão como `/blog/...`: passe sempre por `url()` de
  `src/utils/url.ts`, que aplica o `base`.

## Development

When starting the dev server, use background mode:

```
astro dev --background
```

Manage the background server with `astro dev stop`, `astro dev status`, and `astro dev logs`.

## Documentation

Full documentation: https://docs.astro.build

Consult these guides before working on related tasks:

- [Adding pages, dynamic routes, or middleware](https://docs.astro.build/en/guides/routing/)
- [Working with Astro components](https://docs.astro.build/en/basics/astro-components/)
- [Using React, Vue, Svelte, or other framework components](https://docs.astro.build/en/guides/framework-components/)
- [Adding or managing content](https://docs.astro.build/en/guides/content-collections/)
- [Adding styles or using Tailwind](https://docs.astro.build/en/guides/styling/)
- [Supporting multiple languages](https://docs.astro.build/en/guides/internationalization/)
