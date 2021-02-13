echo "downloading apkurlgrep"
go get -u github.com/ndelphit/apkurlgrep
echo "downloading jadx"

git clone https://github.com/skylot/jadx.git ; cd jadx ; ./gradlew dist
sudo cp build/jadx/bin/jadx /usr/loca/bin

