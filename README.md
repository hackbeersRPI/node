# node-red flujos de ejemplo

En la carpeta [utils](https://github.com/hackbeersRPI/node/tree/master/utils) existen scripts de instalación de node-red, blink1 y sensortag en raspberry pi.

Para importar todos los flows ejecuta la siguiente linea en la carpeta del repositorio:
```
sudo node-red --flowFile flows.json 
```

Ejemplos incluidos:

Para incluir cualquier ejemplo en vuestro área de trabajo, copiad el código e importarlo desde el menú de node-red->import->clipboard.

## Hola mundo
El ejemplo básico de hola mundo
![Hello World](https://github.com/hackbeersRPI/node/static/holamundo.png)
```
[{"id":"54967739.ab6988","type":"inject","z":"60da96e2.9f2568","name":"Hello World","topic":"message","payload":"Hello World!","payloadType":"string","repeat":"","crontab":"","once":true,"x":206,"y":100,"wires":[["77194b7e.88e6b4"]]},{"id":"77194b7e.88e6b4","type":"debug","z":"60da96e2.9f2568","name":"","active":true,"console":"true","complete":"payload","x":496,"y":100,"wires":[]}]
```
