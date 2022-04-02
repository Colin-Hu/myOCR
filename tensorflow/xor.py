import numpy as np
import tensorflow as tf

xor_input = np.array([[0,0],[0,1],[1,0],[1,1]])
xor_output = np.array([0,1,1,0])

xormodel = tf.keras.models.Sequential()
xormodel.add(tf.keras.Input(shape=(2,)))
#xormodel.add(tf.keras.layers.Dense(2, activation='sigmoid'))
xormodel.add(tf.keras.layers.Dense(2, activation='relu'))
xormodel.add(tf.keras.layers.Dense(1))

loss_fn = tf.keras.losses.BinaryCrossentropy(from_logits=True)
#optimizer = tf.keras.optimizers.Adam(learning_rate=0.1)
optimizer = tf.keras.optimizers.Adam()
xormodel.compile(optimizer=optimizer,
              loss=loss_fn,
              metrics=['accuracy'])
xormodel.summary()

xormodel.fit(xor_input, xor_output, verbose=1, epochs=5000)
predictions = xormodel(xor_input).numpy()
print(predictions)
print(tf.nn.softmax(predictions).numpy())

