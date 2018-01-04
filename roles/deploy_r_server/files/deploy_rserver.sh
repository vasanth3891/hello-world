#!/bin/bash
           echo "$(date)"
         #  echo "Deploying R libraries"
         # HOME= "{{ user_home_directory }}"

           R_HOME=$HOME/RServer/R-3.3.3_build/lib64/R
         # R_LIBRARY= /local/apps/"{{r_user}}"/RServer/R-3.3.3_build/lib64/R/library
           cd ${R_HOME}/bin
           echo "Deploying R libraries"

            ./R -e 'Sys.setenv("TMPDIR"="{{user_home_directory}}/RServer/tmp")'
            ./R -e 'install.packages("{{rlibrary_dir}}/Rserve_1.8-5.tar.gz" , repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/timeDate_3012.100.tar.gz" ,repos=NULL,type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/timeSeries_3022.101.2.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/gss_2.1-7.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/stabledist_0.7-1.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/fBasics_3011.87.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/Runiversal_1.0.2.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/zoo_1.8-0.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/xts_0.10-0.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/PerformanceAnalytics_1.4.3541.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/Basic.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/Summary.tar.gz" ,repos=NULL, type="source")'
            ./R -e 'install.packages("{{rlibrary_dir}}/FSA.tar.gz" ,repos=NULL, type="source")'

 #     > install.packages("/local/apps/"{{r_user}}"/RServer/rlibrary/Rserve_1.8-5.tar.gz" , repos=NULL, type="source", configure.args = c("TMPDIR=/local/apps/"{{r_user}}"/RServer/tmp","TMP=/local/apps/"{{r_user}}"/RServer/tmp"), dependencies = TRUE , destdir = "/local/apps/"{{r_user}}"/RServer/tmp")