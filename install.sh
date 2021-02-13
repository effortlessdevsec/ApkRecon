echo "downloading apkurlgrep"
go get -u github.com/ndelphit/apkurlgrep
echo "downloading jadx"

git clone https://github.com/skylot/jadx.git ; cd jadx ; ./gradlew dist
sudo cp build/jadx/bin/jadx /usr/loca/bin

go get -u github.com/tomnomnom/gf

echo "make sure you have set the GOPATH"
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf
cp config/Apksecret.json ~/.gf
