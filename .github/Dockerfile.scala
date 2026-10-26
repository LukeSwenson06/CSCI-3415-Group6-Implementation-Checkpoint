# Scala Dockerfile for testing examples
FROM hseeberger/scala-sbt:8u292_3.3.3_2.13.12

WORKDIR /app

# Copy the Scala example files
COPY jeff/subprograms/scala_subprograms.scala ./subprograms/
COPY jeff/data_types_or_binding/scala_data_types_or_binding.scala ./data_types_or_binding/
COPY jeff/control_structures/scala_control_structures.scala ./control_structures/

# Set working directory to jeff for tests
WORKDIR /app/jeff

# Default command (can be overridden)
CMD ["bash"]
