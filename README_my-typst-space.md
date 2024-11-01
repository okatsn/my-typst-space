# my-typst-space

https://github.com/okatsn/my-typst-space

## Build

```bash
docker build -t okatsn/my-typst-space:latest .
docker push okatsn/my-typst-space:latest
```

Noted that, there is a `lefthook.yml`. You can stage the modified Dockerfile and run `lefthook run pre-commit` manually, which executes `docker_build_and_push.sh`. (`lefthook install` is required)

## Use the image `okatsn/my-typst-space`

!!! note
    This instruction is based on the container [okatsn/MyTeXLifeWithJulia](https://github.com/okatsn/MyTeXLifeWithJulia) and [okatsn/MyQuartoSpace](https://github.com/okatsn/MyQuartoSpace).
    See also the commit difference:
    - https://github.com/okatsn/MyTeXLifeWithJulia/commit/af41d84800fbc843af0eafac3aa7e33526c7abaf
    - https://github.com/okatsn/MyQuartoSpace/commit/95b41ebcb4cfc0fb213fbc442d751ccfb9d818ce

In your `.devcontainer/Dockerfile`:
- Add `FROM okatsn/my-typst-space:latest AS build0` at the very beginning
- Add `COPY --from=build0 /bin/typst /bin` at the very end

In your `.devcontainer/devcontainer.json`

> 📖Explain:
> In the official Dockerfile: https://github.com/typst/typst/blob/main/Dockerfile
> - typst was copied from `/app/.../typst` to  `/bin`
> - it lives in `/bin/typst` in stage `build0`.

## Notes on install of Typst in general
Rust is required:
- https://www.rust-lang.org/learn/get-started

Vscode extensions (Required):
- https://github.com/nvarner/typst-lsp
- https://github.com/Enter-tainer/typst-preview


## Notes on the use of Typst
### How to use
https://typst.app/docs/tutorial/

### MY-BOOKMARK
https://typst.app/docs/tutorial/making-a-template/
https://typst.app/docs/reference/scripting/
