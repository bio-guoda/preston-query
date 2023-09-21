# Query Sample of Global Biotic Interactions Knowledge Graph

The preston data package was produced using

~~~
preston track --algo md5 https://github.com/oxigraph/oxigraph/releases/download/v0.3.18/oxigraph_server_v0.3.18_x86_64_linux_gnu
~~~

and by sampling a snapshot of GloBI's interaction graph 

~~~
echo "curl -L https://zenodo.org/record/8284068/files/interactions.nq.gz | gunzip | head -n10" | preston bash --algo md5
~~~

Then, the sample query was executed using:

~~~
cat example.sparql\
 | ./query.sh $(preston head --algo md5)
~~~

producing:

~~~
