module TestGuruVersion
  MAJOR = 1
  MINOR = 0
  PATCH = 0
  PRE_RELEASE = nil

  VERSION = [MAJOR, MINOR, PATCH].join('.')
  VERSION += "-#{PRE_RELEASE}" if PRE_RELEASE
end