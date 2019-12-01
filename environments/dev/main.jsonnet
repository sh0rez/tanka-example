local app = import "ntppool/app.libsonnet";
app + {
 params+:: {
   ntppool+:: {
     image: "quay.io/ntppool/ntppool:latest",
   },

 },
 config+:: {
        manage_tls: "no",
    },
}
