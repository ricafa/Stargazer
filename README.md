# Stargazer

Blog estático feito com [Astro](https://astro.build), publicado de graça no GitHub Pages.

## Escrever um artigo novo

1. Crie um arquivo `.md` em `src/content/blog/`. O nome do arquivo vira o endereço do post
   (`meu-artigo.md` → `/blog/meu-artigo/`), então use letras minúsculas, sem acentos e com hífens.
2. Comece o arquivo com o bloco de metadados:

   ```markdown
   ---
   title: 'Título do artigo'
   description: 'Uma frase que aparece na listagem e no Google.'
   pubDate: 'Aug 16 2026'
   ---

   O texto do artigo em Markdown.
   ```

   `title`, `description` e `pubDate` são obrigatórios. A data usa o formato em inglês
   (`Aug 16 2026`) porque é assim que o Astro a interpreta — o site exibe em português.

3. Salve, faça `git push`. O GitHub publica sozinho em ~1 minuto.

Campos opcionais: `updatedDate` (mesma formatação de `pubDate`) e `heroImage`
(ex.: `heroImage: '../../assets/minha-imagem.jpg'`, com o arquivo em `src/assets/`).

## Ver o site antes de publicar

```sh
npm run dev
```

Abre em `http://localhost:4321`. Para conferir o resultado final: `npm run build` e `npm run preview`.

## Publicar no GitHub Pages (uma vez só)

1. Crie um repositório no GitHub chamado `Stargazer`.
2. Confira o `site` em `astro.config.mjs` (hoje: `https://ricafa.github.io`).
3. Suba o código:

   ```sh
   git init
   git add .
   git commit -m "Primeiro post"
   git branch -M main
   git remote add origin https://github.com/ricafa/Stargazer.git
   git push -u origin main
   ```

4. No repositório: **Settings → Pages → Build and deployment → Source: GitHub Actions**.

O site fica em `https://ricafa.github.io/Stargazer`.

> Se preferir o endereço sem a subpasta, nomeie o repositório como `ricafa.github.io` e
> remova a linha `base: '/Stargazer'` do `astro.config.mjs`. O resto funciona igual.

## Estrutura

```
src/
  content/blog/     ← os artigos (.md)
  pages/            ← páginas do site (início, /blog, /sobre)
  components/       ← cabeçalho, rodapé, data formatada
  layouts/          ← o visual de um artigo
  utils/url.ts      ← monta links internos respeitando o `base`
public/             ← arquivos servidos como estão (favicon etc.)
```
