import platform

from conan import ConanFile
class RequireLibs(ConanFile):
   settings = "os", "compiler", "build_type", "arch"

   def requirements(self):
      self.requires("cereal/1.3.2.7")
