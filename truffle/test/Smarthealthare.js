const Smarthealthcare = artifacts.require("Smarthealthcare");

require('chai')
    .use(require('chai-as-promised'))
    .should()

contract('Smarthealthcare', ([deployer, patientOne, patientTwo, doctorOne, doctorTwo, insurerOne, insurerTwo]) => {
    let Smarthealthcare

    before(async () => {
        Smarthealthcare = await Smarthealthcare.deployed()
    })

    describe('deployment', async () => {
        it('deploys successfully', async () => {
            const address = await Smarthealthcare.address
            assert.notEqual(address, 0x0)
            assert.notEqual(address, '')
            assert.notEqual(address, null)
            assert.notEqual(address, undefined)
        })
    
        it('has a name', async () => {
            const name = await Smarthealthcare.name()
            assert.equal(name, 'Smarthealthcare')
        })
    })

    describe('patients', async () => {
        let result
        const name = "Ram"
        const age = 22
        const hash = "QmV8cfu6n4NT5xRr2AHdKxFMTZEJrA44qgrBCr739BN9Wb"


        before(async () => {
            result = await Smarthealthcare.add_agent(name, age, 0, hash)
            
        })

        it('adds patients', async () => {
            
        })
    })

});
