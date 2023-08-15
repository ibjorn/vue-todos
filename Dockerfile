FROM node:18

ENV WORKSPACEDIR=/usr/src/app

# Set the working directory
WORKDIR $WORKSPACEDIR

ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

RUN groupmod --gid $USER_GID $USERNAME
RUN usermod --uid $USER_UID --gid $USER_GID $USERNAME
RUN chown -R $USER_UID:$USER_GID $WORKSPACEDIR

# Expose the port that the application will run on
EXPOSE 3000

USER $USERNAME

# Start the application
CMD ["npm", "run", "dev"]