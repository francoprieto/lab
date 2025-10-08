sudo docker volume create --name sonarqube_data
sudo docker volume create --name sonarqube_logs
sudo docker volume create --name sonarqube_extensions
echo "Password: Administrador0$"
echo "SONARTOKEN: 11c4687807ca2e9e7f21a9101286d67a6f"
sudo docker run --rm \
    -p 9000:9000 \
    -v sonarqube_extensions:/opt/sonarqube/extensions \
    sonarqube
