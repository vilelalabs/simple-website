<template>
    <label @click="onLabelClick">{{ label }}</label>
    <span style="display: none">{{ description }}</span>
</template>

<script>
export default {
    name: 'ButtonDescription',
    props: {
        label: String,
        description: String
    },
    methods: {
        onLabelClick(event) {
            //toggle the span element visibility
            event.target.nextElementSibling.style.display = event.target.nextElementSibling.style.display === 'none' ? 'flex' : 'none'
        }
    }
}
</script>


<style scoped>
label {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 4rem;
    border: 1px solid #fff;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    width: 5rem;
}

span {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: #fff;
    color: #2c3e50;
    height: 4rem;
    border-radius: 5px;
    font-weight: bold;
    width: 20rem;
}
</style>
