repo := `basename $(pwd)`
upstream := if repo == "wiki" { "private" } else { "public" }

# Pull from private/public repo
update:
    git fetch --all && git rebase {{ upstream }}/main && git push

# Run Mkdocs server
serve:
    mkdocs serve -a "localhost:8000" >/tmp/mkdocs-serve.log 2>&1
