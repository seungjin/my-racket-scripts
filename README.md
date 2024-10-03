This is a public repo with Github <https://github.com/seungjin/my-racket-scripts/>

May 26, 2024: I decided do use Racket instead of Python for general scripting.



Racket with Container
```console
podman run -it --rm -v $(pwd):/home/racket:z racket/racket:latest bash
```