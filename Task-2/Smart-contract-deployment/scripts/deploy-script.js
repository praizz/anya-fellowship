const main = async () => {
    const ContractFactory = await hre.ethers.getContractFactory('Greeter') // the file name under 'contracts' folder, without '.sol'
    const Contract = await ContractFactory.deploy('hello world') // the constructor params
    await Contract.deployed()
    console.log("Contract deployed to:", Contract.address)
}

const runMain = async () => {
    try {
        await main()
        process.exit(0) // emit the exit event that ends all tasks immediately even if there still are asynchronous operations not been done. The shell that executed node should see the exit code as 0.
    } catch (error) {
        console.log(error)
        process.exit(1)
    }
}

runMain()