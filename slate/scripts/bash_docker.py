from subprocess import check_output, call

def get_bash_login(container, shell='bash'):
    obj = check_output(['docker', 'ps'])
    for line in obj.split('\n'):
        if container in line:
            cmd = 'docker exec -it %s %s' % (line.split(' ')[0], shell)
            call(cmd.split(' '))
