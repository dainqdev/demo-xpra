**BUILD**<br />
`docker build -t xpra/demo:1.0 .`<br />
**RUN**<br />
`sudo docker run --name xpra-demo -p 9876:9876 -d xpra/demo:1.0`<br />
**RUN IN BROWSER**<br />
Connect to http://localhost:9876 in browser to view xeyes window<br />
**DEMO IN BROWSER**<br />
![image](./demo.gif)
