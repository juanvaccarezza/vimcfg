# vimcfg
Mi configuración de vim. 

Hay que bajar todos los archivos al home.

Modo de uso:

El map leader es la coma (,). si queres ver todos los mappings (atajos de teclado) usa :map y los lista.

Para moverse entre las ventanas C-hjkl. (y si lo abriste desde el tmux se mueve bien entre las ventanas del tmux también gracias al .tmux.conf).



Con el .vimrc debería bastar, este instala solo el Vundle y después dentro del vim ejecutar :PliginInstall y se baja todo.

Sino ademas están subidos todos los plugines a este repo para poder bajar todo junto.

#FAQ
##Cuando lo abro con el tmux se ven mal los colores
Probar usando tmux -2. Te podes hacer un alias en el .bashrc para no olvidarte :)
