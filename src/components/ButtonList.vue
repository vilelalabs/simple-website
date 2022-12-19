<template>
    <ul>
        <li @click="toggleControl">
            <ButtonDescription label="Vue" description="Framework para desenvolvimento de aplicações web" />
        </li>
        <li>
            <ButtonDescription label="Jenkins" description="Orquestrador CI/CD" />
        </li>
        <li>
            <ButtonDescription label="Git" description="Controle de versão" />
        </li>
        <li>
            <ButtonDescription label="Docker" description="Containerização de artefatos" />
        </li>
        <li>
            <ButtonDescription label="Slack" description="Mensagem instantânea" />
        </li>
    </ul>
</template>


<script>
import ButtonDescription from './ButtonDescription.vue'
export default {
    name: 'ButtonList',
    components: {
        ButtonDescription
    }
}

</script>

<style scoped>
ul {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    gap: 1rem;
}

li {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    align-items: center;
    gap: 1rem;

    list-style: none;

}
</style>


