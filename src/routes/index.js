const { Router } = require('express')
const os = require('os')

const router = Router()

router.get('/', (req, res) => {
    const responseJson = {
        message: 'Welcome warriors to Golden Owl!',
        hostname: os.hostname(),
    }
    res.json(responseJson)
})

module.exports = router

