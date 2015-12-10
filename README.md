# node-red flujos de ejemplo

En la carpeta [utils](https://github.com/hackbeersRPI/node/tree/master/utils) existen scripts de instalación de node-red, blink1 y sensortag en raspberry pi.

Para importar todos los flows ejecuta la siguiente linea en la carpeta del repositorio:
```
sudo node-red --flowFile flows.json 
```

Ejemplos incluidos:

Para incluir cualquier ejemplo en vuestro área de trabajo, copiad el código e importarlo desde el menú de node-red->import->clipboard.

### Hola mundo
El ejemplo básico de hola mundo
![Hello World](https://github.com/hackbeersRPI/node/blob/master/static/holamundo.png)
```
[{"id":"54967739.ab6988","type":"inject","z":"60da96e2.9f2568","name":"Hello World","topic":"message","payload":"Hello World!","payloadType":"string","repeat":"","crontab":"","once":true,"x":206,"y":100,"wires":[["77194b7e.88e6b4"]]},{"id":"77194b7e.88e6b4","type":"debug","z":"60da96e2.9f2568","name":"","active":true,"console":"true","complete":"payload","x":496,"y":100,"wires":[]}]
```

### Blink
Ejemplo de blink1, trés botones para encender distintos colores en el dispositivo, utiliza el plugin [node-red-node-blink1](http://flows.nodered.org/node/node-red-node-blink1)
![Hello World](https://github.com/hackbeersRPI/node/blob/master/static/blink.png)
```
[{"id":"200e3d9d.dff1c2","type":"inject","z":"1a0319ef.e5fce6","name":"Red","topic":"","payload":"#FF0000","payloadType":"string","repeat":"","crontab":"","once":false,"x":265,"y":121,"wires":[["dfd5d415.202a28"]]},{"id":"a12ca406.5ed358","type":"inject","z":"1a0319ef.e5fce6","name":"Green","topic":"","payload":"0,255,0","payloadType":"string","repeat":"","crontab":"","once":false,"x":266,"y":215,"wires":[["dfd5d415.202a28"]]},{"id":"51b9c937.ae4638","type":"inject","z":"1a0319ef.e5fce6","name":"Blue","topic":"","payload":"blue","payloadType":"string","repeat":"","crontab":"","once":false,"x":266,"y":311,"wires":[["dfd5d415.202a28"]]},{"id":"dfd5d415.202a28","type":"blink1","z":"1a0319ef.e5fce6","fade":"500","name":"","x":622,"y":215,"wires":[]}]
```

### Sensortag
Ejemplo de sensortag, escribir en la consola los valores obtenidos de un sensor, utiliza el plugin [node-red-node-sensortag](http://flows.nodered.org/node/node-red-node-sensortag)
![Hello World](https://github.com/hackbeersRPI/node/blob/master/static/sensortag.png)
```
[{"id":"98877520.677888","type":"debug","z":"1fdbb4c2.e0244b","name":"","active":true,"console":"true","complete":"payload","x":492,"y":105,"wires":[]},{"id":"a3606dd5.5c9f9","type":"delay","z":"1fdbb4c2.e0244b","name":"","pauseType":"rate","timeout":"5","timeoutUnits":"seconds","rate":"6","rateUnits":"minute","randomFirst":"1","randomLast":"5","randomUnits":"seconds","drop":true,"x":297,"y":221,"wires":[["98877520.677888"]]},{"id":"ac2eb0c1.53d15","type":"sensorTag","z":"1fdbb4c2.e0244b","name":"sensorTag","topic":"sensorTag","uuid":"","temperature":true,"humidity":true,"pressure":true,"magnetometer":true,"accelerometer":true,"gyroscope":true,"keys":true,"luxometer":true,"x":138,"y":91,"wires":[["a3606dd5.5c9f9"]]}]
```


### API OpenWeather y Blink
Obteniendo los datos de temperatura del exterior mediante una API rest, encendemos el blink con distintos colores, azul para menos de 20º...
![Hello World](https://github.com/hackbeersRPI/node/blob/master/static/api.png)
```
[{"id":"c394d507.3c6b28","type":"http request","z":"7e26297c.81d9d8","name":"OpenWeather","method":"GET","ret":"txt","url":"api.openweathermap.org/data/2.5/weather?q=Madrid&appid=0650dbd0db749deeb58975730396b31b&units=metric","x":307,"y":145,"wires":[["a44c6745.5bb398"]]},{"id":"a44c6745.5bb398","type":"json","z":"7e26297c.81d9d8","name":"","x":491,"y":145,"wires":[["e23ac4e1.1dc538"]]},{"id":"17e7c679.e8183a","type":"inject","z":"7e26297c.81d9d8","name":"Trigger","topic":"","payload":"","payloadType":"none","repeat":"60","crontab":"","once":true,"x":133,"y":145,"wires":[["c394d507.3c6b28"]]},{"id":"6bdd4287.9422bc","type":"debug","z":"7e26297c.81d9d8","name":"","active":true,"console":"false","complete":"payload","x":895,"y":144,"wires":[]},{"id":"e23ac4e1.1dc538","type":"function","z":"7e26297c.81d9d8","name":"Color","func":"var temp = msg.payload.main.temp;\nif(temp < 20)\n    msg.payload = 'blue';\nelse if(temp > 27)\n    msg.payload = 'red';\nelse msg.payload = 'green';\n\nreturn msg;","outputs":1,"noerr":0,"x":690,"y":145,"wires":[["6bdd4287.9422bc","740411cf.8bfbf"]]},{"id":"740411cf.8bfbf","type":"blink1","z":"7e26297c.81d9d8","fade":"0","name":"","x":882,"y":248,"wires":[]}]
```

### Eddystone
Ejemplo básico de [Eddystone](https://github.com/google/eddystone)
![Hello World](https://github.com/hackbeersRPI/node/blob/master/static/eddystone.png)
```
[{"id":"486101ab.b79f","type":"eddystone-url","z":"83482b8a.7cb7d8","name":"Eddystone URL","url":"http://labs.beeva.com","x":730,"y":199,"wires":[[]]},{"id":"c3ccf7b3.3c3308","type":"inject","z":"83482b8a.7cb7d8","name":"","topic":"","payload":"","payloadType":"none","repeat":"","crontab":"","once":false,"x":302,"y":223,"wires":[["fd91495b.026eb8"]]},{"id":"fd91495b.026eb8","type":"function","z":"83482b8a.7cb7d8","name":"","func":"context.active = !context.active;\nmsg.active = context.active;\nmsg.url = 'http://labs.beeva.com';\nreturn msg;","outputs":1,"noerr":0,"x":483,"y":263,"wires":[["486101ab.b79f"]]}]
```
