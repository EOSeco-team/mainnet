source set-env.sh

docker rm -f $container_name

docker run -ti --detach --name $container_name \
    -v $eos_config_dir:/etc/nodeos -v $eos_data_dir:/data \
    -p $http_port:8888 -p $p2p_port:9876 \
    $docker_tag \
        /opt/eosio/bin/nodeos --data-dir=/data \
        --config-dir=/etc/nodeos \
        --delete-all-blocks \
        --genesis-json=/etc/nodeos/genesis.json 
