echo "⚠️   During the run of this script, please don't close the terminal or press any keys!\n\n"
echo "📀 Cleaning any of the previous fails of this script..."
sudo rm -rf /tmp/Catalina.dmg
echo "✅ Cleanup complete"

echo "📀 Creating temporary .dmg file. It might take a minute or two..."
hdiutil create -o /tmp/Catalina -size 8000m -layout SPUD -fs HFS+J
echo "✅ Creation complete"

echo "🔮 Mounting and doing magic to the volumes. It might take a while..."
hdiutil attach /tmp/Catalina.dmg -noverify -mountpoint /Volumes/install_build
yes Y | sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/install_build
echo "✅ Magic complete"

echo "📀 Detaching volume..."
hdiutil detach /Volumes/Install\ macOS\ Catalina
echo "✅ Volume detached"

echo "📀 Image created! Converting the image..."
hdiutil convert /tmp/Catalina.dmg -format UDTO -o ~/Downloads/Catalina
echo "✅ Conversion complete"

echo "📀 Creating .ISO file..."
mkdir ~/Downloads/ISO
sudo mv ~/Downloads/Catalina.cdr ~/Downloads/ISO/Catalina.iso
echo "✅ Created"

echo "📀 Cleaning temporary stuff..."
sudo rm -rf /tmp/Catalina.dmg
echo "✅ Cleanup complete"

echo "✅ Done !"
open ~/Downloads/ISO