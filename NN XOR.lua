--Neural Network XOR
function NN(hidden)
	--Activation function
	local function Sigmoid(x)
		return 1/(1+math.exp(-x))
	end

	local inputs = {math.random(0, 1), math.random(0, 1)}

	local weights = {}
	for i = 1, table.getn(inputs) * hidden do
		weights[i] = math.random(0, 100) * 0.01
	end

	--Super amazing matrix math I figured out myself!
	local hiddenLayer = {}
	for k, v in pairs(inputs) do
		for i = 1, hidden do
			if k == 1 then
				hiddenLayer[i] = v * weights[i]
			else
				hiddenLayer[i] = hiddenLayer[i] + (v * weights[i+hidden])
			end
		end
	end

	local weights2 = {}
	for k, v in pairs(hiddenLayer) do
		v = Sigmoid(v)
		
		weights2[k] = math.random(0, 100) * 0.01
	end

	local finalOutput = 0
	for i = 1, hidden do
		finalOutput = finalOutput + (hiddenLayer[i] * weights2[i])
	end

	finalOutput = Sigmoid(finalOutput)

	return finalOutput
end

print(NN(3))