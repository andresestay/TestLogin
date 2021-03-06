dataSource{
    pooled=true
    driverClassName="com.mysql.jdbc.Driver"
    username="root"
    password="andres"
}

hibernate{
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}

//environment specific settings
environments{
    development{
        dataSource{
            //dbCreate="create-drop"
            dbCreate="update"
            url="jdbc:mysql://localhost:3306/testlogin"
        }
    }
    test{
        dataSource{
            dbCreate="update"
            url="jdbc:mysql://localhost:3306/testlogin"
        }
    }
    production{
        dataSource{
            dbCreate="update"
            url="jdbc:mysql://localhost:3306/testlogin"
        }
    }
}