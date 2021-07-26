from typing import List
import typer
from loguru import logger
import sys
from pathlib import Path
import importlib
app = typer.Typer()

@logger.catch
def main():
    files = list(Path(sys.argv[0]).parent.rglob('*.py'))
    for file in files:
        if file.samefile(sys.argv[0]):
            continue
        @app.command(name=file.stem)
        def _(args:List[str] = typer.Argument(None)):
            importlib.import_module(str(file.stem))
            print(file.stem)
    app()
main()
print('done')
